window.addEventListener( 'load' , () => {
	document
		.querySelector('select')
		.addEventListener( 'change' , e => {
			e.target.parentNode.submit();
		});
});