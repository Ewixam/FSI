const select = document.querySelector('.action-select');
const div = document.querySelector('.lesNote');

select.addEventListener('change', function() {
        switch(select.value){
                case 'add':
                        div.innerHTML += "<form id='formADD' method='post'><input class='inpt reg' type='text' id='userReg' placeholder='USERNAME'></form>";
                        break;
                case 'del':
                        div.innerHTML += "<form id='formSPR' method='post'><input class='inpt reg' type='text' id='userReg' placeholder='TEST'></form>";
                        break;
        }
});