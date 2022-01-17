name 'library'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'library::default'

# Specify a custom source for a single cookbook:
cookbook 'library', path: '.'
