$(document).ready(function(){

const toDoForm = document.querySelector(".toDoForm");
const toDoInput = toDoForm.querySelector("input");
const toDoList = document.querySelector(".toDoList");

const TODOS_LS = 'toDos';//localStorage를 사용하여 할 일 정보를 브라우저의 로컬 스토리지에 저장
let toDos = []; // 할 일을 저장할 배열

function saveToDos(emp_id) { 
    localStorage.setItem(`TODOS_LS_${emp_id}`, JSON.stringify(toDos));
}

function deleteToDo(event) {
  const btn = event.target;
  const li = btn.parentNode;
  toDoList.removeChild(li); 
  const cleanToDos = toDos.filter(function (toDo) { 
    return toDo.id !== parseInt(li.id);
  });
  toDos = cleanToDos;
  saveToDos(emp_id);// localStorage에 저장
}

function paintToDo(text) {
    const li = document.createElement("li"); 
    const delBtn = document.createElement("button"); 
    const span = document.createElement("span");
    const newId = toDos.length + 1;
    
    delBtn.className = "remove mdi mdi-close";
    delBtn.style.border="none";
    delBtn.style.backgroundColor ="transparent";
    delBtn.addEventListener("click", deleteToDo); 
    span.innerText = text;

    li.appendChild(span); 
    li.appendChild(delBtn);
    
    
    toDoList.appendChild(li);
    li.id = newId; 

    const toDoObj = { 
        text: text,
        id: newId
    };
    toDos.push(toDoObj); 
    saveToDos(emp_id);
}

function handleSubmit(event) {
    event.preventDefault();
    const currentValue = toDoInput.value;
    paintToDo(currentValue);
    toDoInput.value = "";
}

function loadToDos(emp_id) {
    const loadedToDos = localStorage.getItem(`TODOS_LS_${emp_id}`);
    if (loadedToDos !== null) {
        const parsedToDos = JSON.parse(loadedToDos);
        parsedToDos.forEach(function (toDo) {
            paintToDo(toDo.text);
            
        });
    }
}

function init(emp_id) {
    loadToDos(emp_id);
    toDoForm.addEventListener("submit", handleSubmit);
}

init(emp_id);
});