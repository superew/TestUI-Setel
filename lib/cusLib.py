from operator import itemgetter
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

def sort_list_by_price(product_list):
	# sorted_li = sorted(product_list, key=lambda product_li: product_li[2])
	sorted_li = sorted(product_list, key=itemgetter(2))
	return sorted_li


def getTextEle(xpath):
	driver = webdriver.Chrome()
	text = driver.find_element_by_xpath(xpath).text