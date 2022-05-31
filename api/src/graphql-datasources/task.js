const { BaseDS } = require('./base')

class TaskDS extends BaseDS {
    constructor(taskOpts) {
        super(taskOpts)
    }

    async getByEmpId(empId, params={}) {
        var cacheKey = params ? JSON.stringify(params) : 'noparams'
        cacheKey = `employee:${this.cacheKeyBase}:${cacheKey}`

        const cacheDoc = await this.cache.get(cacheKey)
        if (cacheDoc) {
            return JSON.parse(cacheDoc);
        }

        const doc = await this.service.get({
            ...params,
            "employee.id": empId
        })

        this.cache.set(cacheKey, JSON.stringify(doc), { ttl: 3 })

        return doc;
    }
}

exports.TaskDS = TaskDS;
