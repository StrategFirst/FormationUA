window.addEventListener( 'load' , () => {
	document
		.querySelector('select')
		.addEventListener( 'change' , e => {
			e.target.parentNode.submit();
		});

		document.querySelector('button').addEventListener('click' , _ => window.location.href = "./admin") ;
});