Object.entries(incompatible).forEach( matiere => {
	document.querySelector(`#Opt${matiere[0]}`).addEventListener( 'change' , event => {
		changingId = event.currentTarget.id.match(/[0-9]+/)[0];
		if( incompatible[changingId].some( idDown => document.getElementById(`Opt${idDown}`).checked ) ) {
			event.currentTarget.checked = false;
			alert('Choix incompatible');
		}
	});
});

document.querySelector('form').onsubmit = (event) => {
	if(Array.from(document.querySelectorAll('form .choix-groupe')).some( 
		k=>{
			//Récupération du nombre de champs requis pour se groupe
			keep = e=>e.match(/choix-count-([0-9]+)/);
			let nmb_requis = keep(Array.from(k.classList).filter(keep)[0])[1];
			//Récupération du nombre de champs valider pour se groupe
			let nmb_valider = Array.from(k.querySelectorAll('input[type="checkbox"]')).map(b=>+b.checked).reduce((a,c)=>a+c,0);
			return nmb_requis != nmb_valider;
		}
	)){
		alert("Assurez-vous d'avoirs fait suffisament de choix");
		event.preventDefault();
		return false;
	}
};