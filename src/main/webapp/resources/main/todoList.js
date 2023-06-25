$(document).ready(function(){
    const toDoForm = document.querySelector(".toDoForm");
    const toDoInput = toDoForm.querySelector("input");
    const toDoList = document.querySelector(".toDoList");
    const TODOS_LS = 'toDos';
    let toDos = [];

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
        saveToDos(emp_id);
    }

    function toggleCheck(event) {
        const checkbox = event.target;
        const li = checkbox.parentNode;
        const span = li.querySelector("span");
        const toDoId = parseInt(li.id);

        li.classList.toggle("checked");

        if (li.classList.contains("checked")) {
            span.style.color = "gray";
            span.style.textDecoration = "line-through";
            // 체크된 상태를 로컬 스토리지에 저장
            toDos[toDoId - 1].checked = true;
        } else {
            span.style.color = "black";
            span.style.textDecoration = "none";
            // 체크 해제된 상태를 로컬 스토리지에 저장
            toDos[toDoId - 1].checked = false;
        }

        saveToDos(emp_id);
    }

    function paintToDo(text, checked) {
        const li = document.createElement("li");
        const checkbox = document.createElement("input");
        const delBtn = document.createElement("button");
        const span = document.createElement("span");
        const newId = toDos.length + 1;

        checkbox.type = "checkbox";
        checkbox.className = "form-check-input";
        checkbox.addEventListener("change", toggleCheck);
        checkbox.checked = checked;

        delBtn.className = "remove mdi mdi-close";
        delBtn.style.border = "none";
        delBtn.style.backgroundColor = "transparent";
        delBtn.addEventListener("click", deleteToDo);
        span.innerText = text;
        span.style.marginLeft = "8px"; // 체크박스와 글자 사이의 간격 설정

        li.appendChild(checkbox);
        li.appendChild(span);
        li.appendChild(delBtn);

        toDoList.appendChild(li);
        li.id = newId;

        const toDoObj = {
            text: text,
            id: newId,
            checked: checked
        };
        toDos.push(toDoObj);
        saveToDos(emp_id);
    }

    function handleSubmit(event) {
    	  event.preventDefault();
    	  const currentValue = toDoInput.value;
    	  paintToDo(currentValue, false); // 초기 체크 상태는 false로 설정
    	  toDoInput.value = "";
    	}

    	// 버튼 클릭 이벤트 리스너 추가
    	const submitButton = document.querySelector("#submitBtn");
    	submitButton.addEventListener("click", handleSubmit);

    function loadToDos(emp_id) {
        const loadedToDos = localStorage.getItem(`TODOS_LS_${emp_id}`);
        if (loadedToDos !== null) {
            const parsedToDos = JSON.parse(loadedToDos);
            parsedToDos.forEach(function (toDo) {
                paintToDo(toDo.text, toDo.checked);

                // 체크된 상태일 때 회색으로 표시하고 줄을 그어줌
                if (toDo.checked) {
                    const li = document.getElementById(toDo.id);
                    const span = li.querySelector("span");
                    li.classList.add("checked");
                    span.style.color = "gray";
                    span.style.textDecoration = "line-through";
                }
            });
        }
    }

    function init(emp_id) {
        loadToDos(emp_id);
        toDoForm.addEventListener("submit", handleSubmit);
    }

    init(emp_id);
});