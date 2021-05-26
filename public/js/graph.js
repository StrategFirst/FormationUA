function Repartition(emplacement,donnee) {
	let count = 0;
	for(let i in donnee) 
		count += donnee[i];
	for(let i in donnee)
		donnee[i] = 
		{
			'nmb' : donnee[i],
			'prct' : donnee[i] / count
		};
	
	let canvas = document.createElement('canvas');
	let dessin = canvas.getContext('2d');
	let target = document.createElement('ul');

	canvas.classList.add('graph');canvas.classList.add('circular-graph');
	target.classList.add('graph');canvas.classList.add('circular-graph');

	canvas.width = 400;
	canvas.height = 400;
	dessin.fillStyle = '#FFF';
	dessin.fillRect(0,0,canvas.width,canvas.height);
		
	let current = 0;
	let nextColor = ( () => {
		let color = ['red','green','blue','orange'];
		return () => {
			if(color.length > 0)
				return color.shift();
			else
				return `#${Math.floor(Math.random()*16777216).toString(16).toUpperCase().padStart(6,'0')}`;
		}
	} )();
	
	for(let i in donnee) {
		let next = current + donnee[i].prct;
		let ccolor = nextColor();
		dessin.strokeStyle = ccolor;
		dessin.lineWidth = 40;
		dessin.beginPath();
		dessin.arc(
			canvas.width/2,
			canvas.height/2,
			canvas.width/4,
			current * Math.PI * 2,
			next * Math.PI * 2,
			false
		);
		dessin.stroke();
		current = next;
		let item = document.createElement('li');
		item.innerHTML = `<span style="color:${ccolor};">■</span> ${i} [${donnee[i].nmb}]`;
		target.appendChild(item);
	}

	emplacement.appendChild(canvas);
	emplacement.appendChild(target);
}