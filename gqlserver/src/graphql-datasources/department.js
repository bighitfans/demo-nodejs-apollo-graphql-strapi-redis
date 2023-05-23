const { BaseDS } = require("./base");

class DepartmentDS extends BaseDS {
  constructor(departmentOpts) {
    super(departmentOpts);
  }

  async getByEmpId(empId, params = {}) {
    var cacheKey = params ? JSON.stringify(params) : "noparams";
    cacheKey = `employee:${this.cacheKeyBase}:${cacheKey}`;

    const cacheDoc = await this.cache.get(cacheKey);
    if (cacheDoc) {
      return JSON.parse(cacheDoc);
    }

    const doc = await this.service.get({
      ...params,
      "employee.id": empId,
    });

    this.cache.set(cacheKey, JSON.stringify(doc), { ttl: 3 });

    return doc;
  }

  async getByTaskId(taskId, params = {}) {
    var cacheKey = params ? JSON.stringify(params) : "noparams";
    cacheKey = `task:${this.cacheKeyBase}:${cacheKey}`;

    const cacheDoc = await this.cache.get(cacheKey);
    if (cacheDoc) {
      return JSON.parse(cacheDoc);
    }

    const doc = await this.service.get({
      ...params,
      "task.id": taskId,
    });

    this.cache.set(cacheKey, JSON.stringify(doc), { ttl: 3 });

    return doc;
  }
}

exports.DepartmentDS = DepartmentDS;
