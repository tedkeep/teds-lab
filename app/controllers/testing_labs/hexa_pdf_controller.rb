class TestingLabs::HexaPdfController < TestingLabs::ApplicationController
  def generating_pdf; end

  def editing_pdf; end

  def generate_pdf
    doc = HexaPdf::Pdf.new(spoof: true)
    return send_data doc.render, filename: 'example.pdf', type: "application/pdf"
  end

  private

  def pdf_params
    params.require(:pdf).permit(:name)
  end
end