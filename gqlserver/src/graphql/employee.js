//utils
const NotFoundError = require('lib/not_found_error')

module.exports = {
  Query: {
    // resolver: (parent,args,context,info) <- options params
    // here '_' <- parent
    employees: (_,__,context) => context.dataSources.employees.get(),
    employee: (_,{ id },context) => context.dataSources.employees.getById(id) || new NotFoundError(),
  }, // end Query

  // join resolvers
  Employee: {
    // resolver: (parent,args,context,info) <- options params
    tasks: (_,__,context) => context.dataSources.tasks.getByEmpId(_.id)
  },
}
