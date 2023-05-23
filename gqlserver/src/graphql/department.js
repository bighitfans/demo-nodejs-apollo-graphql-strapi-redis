//utils
const NotFoundError = require("lib/not_found_error");

module.exports = {
  Query: {
    // resolver: (parent,args,context,info) <- options params
    // here '_' <- parent
    departments: (_, __, context) => context.dataSources.departments.get(),
    department: (_, { id }, context) =>
      context.dataSources.departments.getById(id) || new NotFoundError(),
  }, // end Query

  // join resolvers
  Department: {
    // resolver: (parent,args,context,info) <- options params
    tasks: (_, __, context) => context.dataSources.tasks.getByTaskId(_.id),
    employees: (_, __, context) =>
      context.dataSources.employees.getByEmpId(_.id),
  },
};
