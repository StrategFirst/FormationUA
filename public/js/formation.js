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
		let form = document.createElement('form') ;
		form.method = 'POST' ;
		form.action = './option' ;

		let token = document.querySelector('#_token');
		token.parentNode.removeChild(token);
		form.appendChild(token);

		let data = document.createElement('input') ; 
		data.value = e.currentTarget.id;
		data.name = 'formation_id' ;
		data.type = 'text' ;

		form.style.display = 'none';
		document.body.appendChild(form);
		form.appendChild(data);
		form.submit();

 	},false));

	
});



