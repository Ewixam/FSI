const select = document.querySelector('.action-select');
const div = document.querySelector('#formADD');

select.addEventListener('change', ()=>{
        change()
});

function onchange(){
        return new Promise((resolve) => 
        {
                console.log("change")
                switch(select.value){
                        case 'add':
                                div.innerHTML = "<input class='inpt tit' type='text' id='userReg' placeholder='TITRE'><input class='inpt ann' type='text' id='userReg' placeholder='ANNEE'><textarea class='inpt res' type='text' id='userReg' placeholder='RESUME'></textarea><input class='inpt img' type='text' id='userReg' placeholder='URL IMAGE'><select class='genre-select'><option value=''>Choisir un Genre</option></select><select class='artiste-select'><option value=''>Choisir un Artiste</option></select>";
                                break
                        case 'addA':
                                div.innerHTML = "<input class='inpt tit' type='text' id='userReg' placeholder='NOM'><input class='inpt ann' type='text' id='userReg' placeholder='PRENOM'><textarea class='inpt res' type='text' id='userReg' placeholder='DATE DE NAISSANCE'>";
                                break
                        case 'del':
                                div.innerHTML = "<input class='inpt tit' type='text' id='userReg' placeholder='TITRE'>";
                                break
                }
                resolve("test")
        })
}

async function change(){
        await onchange()
}