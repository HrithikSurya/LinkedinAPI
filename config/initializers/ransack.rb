Ransack.configure do |c|
  # Change default search parameter key name.
  # Default key name is :q
  # c.search_key = :query
  
  # Change whitespace stripping behavior.
  # Default is true
  c.strip_whitespace = false

  # Raise errors if a query contains an unknown predicate or attribute.
  # Default is true (do not raise error on unknown conditions).
  #   config.ignore_unknown_conditions = false
  
  # Globally display sort links without the order indicator arrow.
  # Default is false (sort order indicators are displayed).
  # This can also be configured individually in each sort link (see the README).
  # config.hide_sort_order_indicators = true

end