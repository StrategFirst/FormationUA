window.addEventListener( 'load' , () => {
	// Search bar
	const fun = e => {
			const text = e.target.value.toLowerCase();
			Array.from(document.querySelectorAll('main section')).forEach( element => {
				if( element.querySelector('h3').textContent.toLowerCase().indexOf(text) == -1 ) {
					element.style.display = 'none';
				} else {
					element.style.display = '';
				}
			});
		};
	const balise = document.querySelector('#search');
	['change','keydown','keyup'].forEach( evenement => balise.addEventListener( evenement , fun ));
	fun({target:balise});

	// Click
	Array.from(document.querySelectorAll('main section')).forEach( element => element.addEventListener( 'click' , e => {
	} );

});



