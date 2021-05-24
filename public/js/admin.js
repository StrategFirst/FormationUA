function updateInfo(aside) {

	aside.innerHTML = '';
	fetch( `${window.location.href}/api` )
		.then( response => {
			if(response.status === 200) {
				return response.json();
			} else {
				throw "";
			} } )
		.then( json => {
			for(let info of Object.entries(json)) {
				let block = document.createElement('div');
				let titre = document.createElement('h4');
				let data = document.createElement('p');

				[titre.textContent,data.textContent] = info;

				block.appendChild(titre);
				block.appendChild(data);

				aside.appendChild(block);
			}
		 } )
		.catch( _ => aside.innerHTML = '<h4>Une erreur est survenu lors du traitement des données</h4>');
	setTimeout(updateInfo,45_000,aside);
}

updateInfo( document.querySelector('aside') );
