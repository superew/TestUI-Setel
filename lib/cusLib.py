def sort_list_by_price(product_list):
	sorted_li = sorted(product_list, key=lambda product_li: product_li[2])
	return sorted_li
