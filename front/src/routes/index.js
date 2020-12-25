// App.js
import React from 'react'

import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import { RelayEnvironmentProvider } from 'relay-hooks'

import environment from '@/utils/relay-environment'

import Users from './users'
import User from './users/user'

const render = () => {
  return (
    <RelayEnvironmentProvider environment={environment}>
      <div className="p-4">
        <Router>
          <Switch>
            <Route path="/user/:id" component={User} exact />

            <Route path="/" component={Users} exact />
          </Switch>
        </Router>
      </div>
    </RelayEnvironmentProvider>
  )
}

export default render
