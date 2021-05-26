function updateInfo(aside) {

	aside.innerHTML = '';
	fetch( `/admin/api` )
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


document.getElementById('recup-csv').onclick = (event) => {
	let x = document.createElement('a');
	let y = document.createElement('a');
	let z = document.createElement('a');

	x.href= './recup/etudiants.csv';
	y.href= './recup/matieres.csv';
	z.href= './recup/formation.csv';

	x.style.display = 'none';
	y.style.display = 'none';
	z.style.display = 'none';

	document.body.appendChild(x);
	document.body.appendChild(y);
	document.body.appendChild(z);

	const delay = ( a ) => { a.click(); document.body.removeChild(a); };
	setTimeout( delay , 000 , x);
	setTimeout( delay , 400 , y);
	setTimeout( delay , 800 , z);

	event.preventDefault();
	return false;
}
