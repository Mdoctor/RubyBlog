#encoding=UTF-8
require 'rubygems'
require 'mechanize'
require 'openssl'

module CrawlerHelper
end



class SearchCrawler
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  @agent = Mechanize.new
  @page = @agent.get('http://staging2.lexisnexis.com.cn/')

  @form = @page.forms[1]
  @form.field_with(:name=>"id").value="jaggerjiang"
  @form.field_with(:name=>"pwd").value="abc123z"
  @form.click_button

  def self.landingSearchUrl keyword
    url='http://staging2.lexisnexis.com.cn/lnc/simpleSearch.php?act=result&searchType=law%7Ccase%7Cip_hottopic%7Cep_elearning%7Cex_questions%7Cep_news%7Cep_news_law%7Cep_news_case%7Coverview%7Ccommentary%7Cdtt%7Cjournal%7CprofNewsletter%7Cexpert%7Cforeignlaw%7Cnewsletter%7Cpg_template%7Cpg_checklists%7Cpg_gov_form%7Cip_guide%7Cnational_standard%7Cadmin_penalty%7Cpg_tax_case%7Cspecial_section%7Cintl_insight%7Cworkflow&previousKeyword=%E5%8A%B3%E5%8A%A8%E6%B3%95&eng=0&searchTypes%5B%5D=law&searchTypes%5B%5D=case&searchTypes%5B%5D=ip_hottopic&searchTypes%5B%5D=ep_elearning&searchTypes%5B%5D=ex_questions&searchTypes%5B%5D=ep_news&searchTypes%5B%5D=ep_news_law&searchTypes%5B%5D=ep_news_case&searchTypes%5B%5D=overview&searchTypes%5B%5D=commentary&searchTypes%5B%5D=dtt&searchTypes%5B%5D=journal&searchTypes%5B%5D=profNewsletter&searchTypes%5B%5D=expert&searchTypes%5B%5D=foreignlaw&searchTypes%5B%5D=newsletter&searchTypes%5B%5D=pg_template&searchTypes%5B%5D=pg_checklists&searchTypes%5B%5D=pg_gov_form&searchTypes%5B%5D=ip_guide&searchTypes%5B%5D=national_standard&searchTypes%5B%5D=admin_penalty&searchTypes%5B%5D=pg_tax_case&searchTypes%5B%5D=special_section&searchTypes%5B%5D=intl_insight&searchTypes%5B%5D=workflow&all=all&keyword='+keyword+'&submit=%E9%87%8D%E6%96%B0%E6%90%9C%E7%B4%A2&&loading=1'
  end

  def self.landingSearch keyword
    landingSearchListPage=@agent.get(landingSearchUrl keyword)
    legal=landingSearchListPage.css('#legal_list')
    listHash={}
    legal.css('.s_t').each do |li|
      hash=li.css('a')[0].to_h
      hash["text"]=li.css('a')[0].text
      listHash[listHash.length]=hash
    end
    listHash
  end
end