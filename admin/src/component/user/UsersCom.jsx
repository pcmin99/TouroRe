import React, { useEffect, useState } from "react";
import { users } from "../../data/users";
import UserCard from "../cards/UserCard";
import Pagination from "../teams/Pagination";
import axios from "axios";
import SearchBar from "../../component/user/SearchBar";

function UsersCom() {

  const [page, setPage] = useState(1);
  const [show, setShow] = useState(25);
  const [users, setUsers] = useState([]);
  const [inputValue, setInputValue] = useState("");
  const baseUrl = "http://localhost:8080";
  const profileImg = "../../../../user/coding/src/main/resources/static/assets/images/profile"


  const indexOfLastItem = page * show;
  const indexOfFirstItem = indexOfLastItem - show;
  
  const currentItems = users.slice(indexOfFirstItem, indexOfLastItem);

  useEffect(() => {
    axios.get(baseUrl + "/user/userList").then((result) => {
      const users = result.data;
      console.log(users);
    
      setUsers([...users]);
    });
  }, []);

  const handleSearch = (searchResult) => {
    setUsers(searchResult);
  };

  return (
    <div className="row">
       <SearchBar onSearch={handleSearch} />
      {currentItems.map((user) => (
        <UserCard user={user} key={user.userId}/>
      ))}
      <Pagination className={"crancy-pagination__v3"}
              show={show}
              users={users}
              page={page}
              setPage={setPage}
              setShow={setShow} />
    </div>
  );
}

export default UsersCom;
