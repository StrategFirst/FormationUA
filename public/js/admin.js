function updateInfo(aside) {
	fetch( `${window.location.href}/api` )
		.then( response => {
			if(response.status === 200) {
				return response.json();
			} else {
				return aside.innerText = 'Erreur dans l\'api !';
			} } )
		.then( json => aside.innerText = JSON.stringify(json) )
		.catch( err => aside.innerText = 'Une erreur est survenu lors du traitement des données');
	setTimeout(updateInfo,45_000,aside);
}

updateInfo( document.querySelector('aside') );
