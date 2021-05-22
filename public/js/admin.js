function updateInfo(aside) {
	fetch( `${window.location.href}/info` )
		.then( response => response.json() )
		.then( json => aside.innerText = JSON.stringify(json) )
		.catch( err => aside.innerText = 'An error occured while trying to fetch data');
	setTimeout(updateInfo,2500,aside);
}

updateInfo( document.querySelector('aside') );
