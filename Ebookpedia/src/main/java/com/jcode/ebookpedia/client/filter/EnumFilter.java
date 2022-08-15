package com.jcode.ebookpedia.client.filter;

public class EnumFilter extends AbstractFilter<Enum<?>> {

	// For serialization
	protected EnumFilter() {
	}

	public EnumFilter(String fieldName, FilterOperator comparison, Enum<?> value) {
		super(fieldName, comparison, value);
	}
}