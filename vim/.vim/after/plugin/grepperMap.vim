" global substitute
vnoremap S
	\ :<c-u>call GrepperOperator(visualmode())<cr>
	\ :<c-u>cfdo %s///g \| update
			\<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
