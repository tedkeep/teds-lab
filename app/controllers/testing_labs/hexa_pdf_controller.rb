class TestingLabs::HexaPdfController < TestingLabs::ApplicationController
  def generating_pdf; end

  def generate_pdf
    doc = HexaPdf::Pdf.new
    send_data doc, filename: 'example.pdf'
  end

  private

  def pdf_params
    params.require(:pdf).permit(:name)
  end
end