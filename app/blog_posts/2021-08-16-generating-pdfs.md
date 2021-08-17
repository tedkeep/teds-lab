# Generating PDFs using HexaPDF

Generating PDFs isn't a very exciting topic but it's a tool required in many web apps. It's a very useful feature for users so they can share information and data to others who don't have access to the web app. 

There are a few Ruby Gems that offer a way to generate PDFs. By far the most popular is [PrawnPDF](https://github.com/prawnpdf/prawn). It offers a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) which allows you to build up a PDF with text, images, shapes, etc. Having used this gem in a commercial application, it's got a bit of a learning curve to it but allows you to produce professional looking PDFs with relative ease. 

It does have a limitation though which is it can only generate new PDF documents. It cannot open existing PDFs. This is fine in most cases, however there are scenarios where this could be a deciding factor as to whether it's the right gem for you. For example, if you need to open already generated PDFs to add a watermark on to it. In comes [HexaPDF](https://hexapdf.gettalong.org/index.html). 

HexaPDF offers a way to do everything PrawnPDF offers with generating PDF documents with it's own DSL. However, because Hexa is based on the PDF standard it allows you to open existing PDFs so you can manipulate, merge or extract content, or even optimize the PDF to reduce its file size.

This is all very cool sounding and feature rich, but I wanted to try it out for myself to see how well it all works.
