const formRegister = document.getElementById("formReg");
const formLogin = document.getElementById("formLog");
const usernameRegister = document.getElementById("userReg").value;
const usernameLogin = document.getElementById("userLog").value;
const passR1 = document.getElementById("passReg1").value;
const passR2 = document.getElementById("passReg2").value;
const passL1 = document.getElementById("passLog").value;
const btn = document.querySelectorAll(".btn");

btn.forEach(btn => 
{
    btn.addEventListener("click", () =>
        {
        if (btn.matches('.REGISTER'))
        {
            if(passR1 == passR2)
            {
                  var data = new Object();
                  data.action = "Register";
                  data.username = usernameRegister;
                  data.password = passR1;
                  console.log(data.password);
                  const jsonData = JSON.stringify(data);
                  submitForm(jsonData);
            }
            else
            {
                  console.log("les mots de passe ne sont pas les mêmes")
            }
        }
        if (btn.matches('.CONNECT'))
        {
            const data = new Object();
            data.action = "Login";
            data.username = usernameLogin;
            data.password = passL1;
            console.log(data.password);
            const jsonData = JSON.stringify(data);
            submitForm(jsonData);
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
            console.log(JSON.parse(xhr.responseText));
        else
        console.log(xhr.status);
        }
    }; 
 
   xhr.open("POST", "./assets/php/connexion.php");
   xhr.setRequestHeader("Content-Type", "application/json");
   xhr.send("data="+data);
} 