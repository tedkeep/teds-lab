class HexaPdf::Pdf < HexaPDF::Document
  def initialize(io: nil, decryption_opts: nil, config: nil)
    super()
    page = pages.add
    canvas = page.canvas
    canvas.font('Helvetica', size: 50).fill_color(0,128,255)
    canvas.text("Hello World", at: [150,396])
  end

end