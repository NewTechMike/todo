import React, { useEffect, useState } from "react";

function Lists(){
const [lists, setLists ] = useState([])

  useEffect(()=>{
    fetch('/lists')
    .then((r)=>r.json())
    .then((listData)=>setLists(listData))
  },[])

  /* const showLists = lists.map((listObj) =>
    <ul key={listObj.id}> {listObj.name} </ul>
  );  */

  function handleListSubmit(e){
    e.preventDefault();
    console.log("New List: ", e)
    fetch('/lists', {
      method: "POST", 
      headers: {
        "Content-Type": "application/json"
      }, 
      body: JSON.stringify(),
    }).then((r)=>{
      if(r.ok){
        r.json().then((list)=> console.log("Lists: ", list))
      }
    })
      //need to finish the POST requests for creating
      //a New List
    }//look into better way to fetch
  
    //{showLists}
  return(
    <div>
      <div> The Lists </div>
     
      <form onSubmit={handleListSubmit}>
        <input 
          type="text"
          id="newlist"
          autoComplete="off"
          onChange={(e)=>setLists(e.target.value)}
          ></input>
          <button type="submit">Create New List</button>
      </form>
     
    </div>
  )
}

export default Lists;