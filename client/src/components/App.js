import React, { useState, useEffect } from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./Login";
import Welcome from "./Welcome";
import NavBar from "./NavBar";

function App() {
  const [count, setCount] = useState(0);

  /* require('react-dom');
  window.React2 = require('react');
  console.log(window.React1 === window.React2); */

  useEffect(() => {
    fetch("/hello")
      .then((r) => r.json())
      .then((data) => setCount(data.count));
  }, []);

  return (
    <div className="App">
      <NavBar />
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/welcome" element={<Welcome />} />
      </Routes>
    </div>
  );
}

export default App;