import { useState, useEffect } from "react";
import { Route, Routes } from "react-router-dom";
import Login from "./Login";
import Welcome from "./Welcome";

function App() {
  const [count, setCount] = useState(0);

  require('react-dom');
  window.React2 = require('react');
  console.log(window.React1 === window.React2);


  useEffect(() => {
    fetch("/hello")
      .then((r) => r.json())
      .then((data) => setCount(data.count));
  }, []);


  {/* <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/welcome" element={<Welcome />} />          
      </Routes> */}
  return (
    <div className="App">
      <h1>Page Count: {count}</h1>
      
    </div>
  );
}

export default App;