import {Loader, Welcome, Footer, Transaction, Services, Navbar} from './components/index.js'
import React from 'react';


const App = () => {

  return (
      <div className='min-h-screen'>
          <div className='gradient-bg-welcome'>
            <Navbar/>
            <Loader/>
          <Services/>
          <Transaction/>
          <Footer/>
      </div>
      </div>

  )
}

export default App
