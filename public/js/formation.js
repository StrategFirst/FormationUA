window.addEventListener( 'load' , () => {
	// Search bar
	const changeSectionVisibility = e => { //Change la visiblité d'une formation en fonction de la recherche
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
	['change','keydown','keyup'].forEach( evenement => balise.addEventListener( evenement , changeSectionVisibility ));
	changeSectionVisibility({target:balise});

	// Click
	// Permet de créer un formulaire custom et de l'activer lors du clique sur une formation
	Array.from(document.querySelectorAll('main section')).forEach( element => element.addEventListener( 'click' , e => {
		let form = document.createElement('form') ;
		form.method = 'POST' ;
		form.action = './option' ;

		// Token CSRF généré par laravel pour sécurisé la requête POST
		let token = document.querySelector('#_token');
		token.parentNode.removeChild(token);
		form.appendChild(token);

		// Transfer l'information choisi
		let data = document.createElement('input') ; 
		data.value = e.currentTarget.id;
		data.name = 'formation_id' ;
		data.type = 'text' ;

		// Un formulaire doit appartenir a la page pour la redirigé
		form.style.display = 'none';
		document.body.appendChild(form);
		form.appendChild(data);
		form.submit();

 	},false));

	
});



