module endless_reader(

  input wire clk,
  input wire rst_n,

	input	wire [31:0]	image_size,
	output	wire	mem_master_control_fixed_location,
	output	wire [31:0]	mem_master_control_read_base,
	output	wire [31:0]	mem_master_control_read_length,
	output	wire	mem_master_control_go,
	input		wire mem_master_control_done,
	input		wire mem_master_control_early_done,
	output	wire	mem_master_user_read_buffer,
	input		wire [31:0] mem_master_user_buffer_output_data,
	input		wire mem_master_user_data_available,
	output reg [31:0] length_left,
	input wire chip_sel,
//	input wire force_read
  input wire rdclk,
  output wire [32:0] out_pix_data,
  output wire rdempty,
  input wire rdreq
);


wire wrfull;
wire wrreq;
wire [3:0] pix_data;

assign wrreq = mem_master_user_data_available && !wrfull;

color_mapper mapper1(
  .short(pix_data),
  .long(out_pix_data)
);

fifo fifo1(

	.aclr(~rst_n),
	.data(mem_master_user_buffer_output_data),
	.wrclk(clk),
	.wrreq(wrreq),
	.wrfull(wrfull),
	
	.rdclk(rdclk),
	.rdreq(rdreq),
	.q(pix_data),
	.rdempty(rdempty),

);
assign mem_master_control_fixed_location = 0;
assign mem_master_control_read_base = chip_sel ? 32'h800_0000 : 32'h810_0000;
assign mem_master_control_read_length = image_size;
assign mem_master_control_go = mem_master_control_early_done ;
assign mem_master_user_read_buffer = wrreq ;

always @ (posedge clk or negedge rst_n) begin

  if (rst_n == 0) begin
    length_left <= 32'd0;
  end else begin
    if (mem_master_user_read_buffer) begin
      length_left <= length_left == 32'd0 ? image_size - 4 : length_left - 4; 
    end else begin
      length_left <= length_left;
    end
  end

end
endmodule


module color_mapper(
  input wire [3:0] short, 
  output wire [32:0] long
);

assign long = (short[3] == 1'b0) ? ({
  short[0]?8'hff:8'h00,
  short[1]?8'hff:8'h00,
  short[2]?8'hff:8'h00,
  8'hff
}):(
  (short ==  4'hf) ? 32'h00_00_00_02 : (
    (short == 4'he) ? 32'h00_00_00_01 : 32'h00_00_00_00
  )
);
endmodule
