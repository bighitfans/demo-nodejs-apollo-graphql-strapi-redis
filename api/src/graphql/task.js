//utils
const NotFoundError = require('lib/not_found_error')

module.exports = {
  Query: {
    // resolver: (parent,args,context,info) <- options params
    // here '_' <- parent
    tasks: (_,__,context) => context.dataSources.tasks.get(),
    task: (_,{ id },context) => context.dataSources.tasks.getById(id) || new NotFoundError(),
  }, // end Query

  // join resolvers
  Task: {
    employee: (_,__,context) => context.dataSources.employees.getById(_.employee.id)
  }
}

