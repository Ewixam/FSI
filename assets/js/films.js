const fictionBtnElement = document.querySelector(".fictionBtn")
const humorBtnElement = document.querySelector(".humorBtn")
const horrorBtnElement = document.querySelector(".dramaBtn")
const actionBtnElement = document.querySelector(".actionBtn")
const categorieTextElement = document.querySelector(".categorieText")
const searchButton = document.querySelector(".searchButton")
//DIV IMG
const img = document.querySelector(".imgs")

window.onload = init();

async function init()
{
    let films = await submitForm("init")
    console.log(films);
    clickImage(films);
}

function submitForm(action)
{ 
    return new Promise((resolve, reject) => {

        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange  = function()
        { 
        if(xhr.readyState  == 4)
        {    
            if(xhr.status  == 200){
                let json = JSON.parse(xhr.responseText);
                img.innerHTML = "";
                if(json[1]==1054){
                    img.innerHTML = "Aucun contenu disponible";
                }else{
                    json.forEach(element => {
                        img.innerHTML+= "<img class='film-Image' data-d='"+element.titre+"' src="+element.Image+" width='194px' height='285px'>";
                    });
                }
                resolve(json);
            }else
                console.log(xhr.status);
                reject(xhr.statusText);
            }
        };
        xhr.open('POST', './assets/php/film.php?action='+action);
        xhr.send();
    });
} 

fictionBtnElement.addEventListener('click', async () =>
{
    categorieTextElement.textContent = "Fiction"
    let films = await submitForm("fiction")
    clickImage(films)
})

humorBtnElement.addEventListener('click', async () =>
{
    categorieTextElement.textContent = "Comedie"
    let films = await submitForm("comedie")
    clickImage(films)
})

horrorBtnElement.addEventListener('click', async () =>
{
    categorieTextElement.textContent = "Drame"
    let films = await submitForm("drame")
    clickImage(films)
})

actionBtnElement.addEventListener('click', async () =>
{
    categorieTextElement.textContent = "Action"
    let films = await submitForm("action")
    clickImage(films)
})

searchButton.addEventListener('click', () =>
{
    const xhr = new XMLHttpRequest();
    const inputSearch = document.querySelector(".inputSearch")

    xhr.onreadystatechange  = function()
    { 
       if(xhr.readyState  == 4)
       {    
        if(xhr.status  == 200){
            let json = JSON.parse(xhr.responseText);
            img.innerHTML = "";
            json.forEach(element => {
                img.innerHTML+= "<img class='film-Image' data-d='"+element.titre+"' src="+element.Image+" width='194px' height='285px'>";
            });
        }else
            console.log(xhr.status);
        }
    };
   xhr.open('POST', './assets/php/film.php?action='+inputSearch.value);
   xhr.send();
})