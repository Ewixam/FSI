const formRegister = document.getElementById("formReg");
const formLogin = document.getElementById("formLog");
const usernameRegister = document.getElementById("userReg");
const usernameLogin = document.getElementById("userLog");
const passR1 = document.getElementById("passReg1");
const passR2 = document.getElementById("passReg2");
const passL1 = document.getElementById("passLog");
const btn = document.querySelectorAll(".btn");
// DOM
const dediElement = document.querySelector(".dedi")
const backgroundSoundElement = new Audio("./assets/audio/background-music.mp3")

btn.forEach(btn => 
{
    btn.addEventListener("click", () =>
        {
        if (btn.matches('.REGISTER'))
        {
            console.log(passR1.value)
            if(passR1.value == passR2.value)
            {
                let data =
                    {
                        action : "Register",
                        username :usernameRegister.value,
                        password :passR1.value,
                    }
                submitForm(data);
            }
            else
            {
                  console.log("les mots de passe ne sont pas les mêmes")
            }
        }
        if (btn.matches('.CONNECT'))
        {
            let data =
                {
                    'action': "Connect",
                    'username':usernameLogin.value,
                    'password':passL1.value,
                }
                console.log(data)
            submitForm(data);
        }
    })
});

function submitForm(data)
{ 
    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange  = function() 
    { 
       if(xhr.readyState  == 4)
       {    
        if(xhr.status  == 200)
            verifAction(xhr.responseText);
        else
            console.log(xhr.status);
        }
    }; 
 
   xhr.open('POST', './assets/php/connexion.php?action='+data.action+'&username='+data.username+"&password="+data.password);
   xhr.setRequestHeader("Content-Type", "application/json");
   xhr.send();
} 

function verifAction(response)
{
    switch(response){
        case "Connected": 
            window.location.href = "film.html";
            break;
        case "Username or password wrong":
            break;
        case "Account already exist":
            break;
        case "Account Create":
            window.location.href = "film.html";
            break;
    }
}

dediElement.addEventListener('click', () =>
{
    backgroundSoundElement.volume = 0.1
    backgroundSoundElement.play()
})

