module PagesHelper
  def even_frame
    content_tag(:iframe, '', src: 'https://cla.evenfinancial.com/index.html?company_uuid=05a8f648-2156-4356-82d7-928043f4791d&access_token=156acc11-df6e-49a1-af74-5beed1a3975f_444d7a59-8fdb-4585-bab7-ade5132d9ed0&act=F18B21&suc=009933&cur=3399FF&purpose=student_loan&display_mode=FULL_PAGE_CLA', id: "even-iframe-embed", class:"even-iframe", onload: "window.Even.iframeInitialized(this.id)", style: "border: none;")
  end
end