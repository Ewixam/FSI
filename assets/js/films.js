const fictionBtnElement = document.querySelector(".fictionBtn")
const humorBtnElement = document.querySelector(".humorBtn")
const horrorBtnElement = document.querySelector(".horrorBtn")
const actionBtnElement = document.querySelector(".actionBtn")
const categorieTextElement = document.querySelector(".categorieText")
const searchButton = document.querySelector(".searchButton")
//DIV IMG
const img = document.querySelector(".imgs")

window.onload = init();

function init()
{
    submitForm("init")
}

function submitForm(action)
{ 
    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange  = function()
    { 
       if(xhr.readyState  == 4)
       {    
        if(xhr.status  == 200){
            let json = JSON.parse(xhr.responseText);
            img.innerHTML = "";
            json.forEach(element => {
                img.innerHTML+= "<img class="+element.titre+" src="+element.Image+" width='194px' height='285px'>";
            });
        }else
            console.log(xhr.status);
        }
    };
   xhr.open('POST', './assets/php/film.php?action='+action);
   xhr.send();
} 

fictionBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Fiction"
    submitForm("fiction");
})

humorBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Comedie"
    submitForm("comedie");
})

horrorBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Horreur"
    submitForm("horreur");
})

actionBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Action"
    submitForm("action");
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
                img.innerHTML+= "<img class="+element.titre+" src="+element.Image+" width='194px' height='285px'>";
            });
        }else
            console.log(xhr.status);
        }
    };
   xhr.open('POST', './assets/php/film.php?action='+inputSearch.value);
   xhr.send();
})