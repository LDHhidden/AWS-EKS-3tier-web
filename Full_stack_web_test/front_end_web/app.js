const API_BASE = "/api/users/";

const userList = document.getElementById("user-list");
const userForm = document.getElementById("user-form");
const usernameInput = document.getElementById("username");
const emailInput = document.getElementById("email");

async function loadUsers() {
  try {
    const response = await fetch(API_BASE);
    const users = await response.json();

    userList.innerHTML = "";

    users.forEach(user => {
      const li = document.createElement("li");
      li.textContent = `${user.username} (${user.email})`;
      userList.appendChild(li);
    });
  } catch (error) {
    console.error("사용자 목록 조회 실패:", error);
  }
}

userForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const payload = {
    username: usernameInput.value,
    email: emailInput.value
  };

  try {
    const response = await fetch(API_BASE, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(payload)
    });

    if (!response.ok) {
      throw new Error("사용자 생성 실패");
    }

    usernameInput.value = "";
    emailInput.value = "";

    await loadUsers();
  } catch (error) {
    console.error("사용자 생성 오류:", error);
  }
});

loadUsers();