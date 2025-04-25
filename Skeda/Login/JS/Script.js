"use strict"

function Login(userType)
{
    // Esegui la "fade out" del contenuto esistente
    const container = document.getElementById("container");

    setTimeout(async () => {
        // Una volta svanito, cambia l'HTML
        document.querySelector("main").innerHTML = `
        <div id="container" style="opacity: 0; transition: opacity 0.25s;">
            <form id="frm">
                <div class="form-group" style="color: white">
                    <h1>${userType} sign in</h1>
                    <input type="button" onclick="goBack()">
                </div>
                <div class="form-group">
                    <label for="sltSchool">School:</label>
                    <select id="sltSchool" name="adminID"></select>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Email address">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type="submit" value="Login">
                </div>
                <div class="form-group" id="toastContainer" style="display:none;">
                    <div class="errorToast"></div>
                </div>
            </form>
        </div>
    `;
        const sltSchool=document.getElementById("sltSchool");
        try{
            const request = await fetch("PHP/GetSchools.php", {
                method: "GET"
            });
            let response=await request.json();
            if(response.success)
            {
                response.data.forEach(element => {
                    const option = document.createElement("option");
                    option.value = element.adminID;
                    option.textContent = element.name;
                    sltSchool.appendChild(option);
                });
            }
            else
                showToast(response.resultText);
        }catch(err){
            showToast("Errore caricamento delle scuole riprovare più tardi");
        }

        // Esegui la "fade in"
        const newContainer = document.getElementById("container");
        requestAnimationFrame(() => {
            newContainer.style.opacity = 1;
        });

        // Gestione submit form
        const form = document.getElementById("frm");
        form.addEventListener("submit", async (e) => {
            e.preventDefault();

            const formData = new FormData(form);
            const params = new URLSearchParams(formData);

            try {
                let phpPathFile="PHP/";
                switch(userType)
                {
                    case "student":
                        phpPathFile+="LoginStudent.php";
                        break;
                    case "parent":
                        phpPathFile+="LoginParent.php";
                        break;
                    case "teacher":
                        phpPathFile+="LoginTeacher.php";
                        break;
                }
                const response = await fetch(phpPathFile, {method: "POST",headers: {"Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"},body: params.toString()});

                const data = await response.json();
                if(data.result.success)
                    window.location.href = data.result.redirect;
                else
                    showToast(data.result.resultText);
            } catch (err) {
                //console.error("Errore AJAX:", err);
                showToast("Errore di connessione al server."+err.message);
            }
        });
    }, 250);
}
function showToast(message) {
    const toastContainer = document.getElementById("toastContainer");
    const errorToast = toastContainer.querySelector(".errorToast");
    errorToast.textContent = message;
    toastContainer.style.display = "block";
}
function goBack(){
    const container = document.getElementById("container");
    container.style.opacity = 0;
    setTimeout( () => {

        document.querySelector("main").innerHTML = `
            <div id="container" style="opacity: 0; transition: opacity 0.25s;">
        <button id="btnStudent" class="btnLogin" onclick="Login('student')"><span class="overlay">STUDENT</span></button>
        <button id="btnParent" class="btnLogin" onclick="Login('parent')"><span class="overlay">PARENT</span></button>
        <button id="btnTeacher" class="btnLogin" onclick="Login('teacher')"><span class="overlay">TEACHER</span></button>
            </div>        
`;
        const newContainer = document.getElementById("container");
        requestAnimationFrame(() => {
            newContainer.style.opacity = 1;
    },250)

    });
}
