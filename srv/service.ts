import cds from '@sap/cds';
import CrudHelper from '../utils/crudHelper';
import { Books } from '#cds-models/appBuildCodeService';
import TextBundle from '../utils/textBundle';

export class appBuildCodeService extends cds.ApplicationService {
    init() {

        const crudHelper = new CrudHelper();
        const { fnGetTextBundle } = new TextBundle();
        const bundle = fnGetTextBundle("en");

        this.on('fnCrud', async req => {
            try {
                const { action } = req.data;
                let entity: string;
                let entries: object[];
                let where: object;
                let result: object = {};

                switch (action) {
                    case "create":
                        entity = "Books";
                        entries = [{
                            isbn: 12345,
                            title: "Test",
                            author: "Test Author",
                            publishedDate: "2000-01-01",
                            price: 100,
                            categories1: "813e5770-04ff-4ea3-89ea-6963ef2c374f",
                            orders: "b2bce519-d3ae-45e9-b0dc-cb46f15b56fc"
                        }];

                        result = await crudHelper.fnCreate(entity, entries);
                        break;
                    case "upsert":
                        break;
                    case "read":
                        entity = "Books";
                        where = {
                            title: "Test",
                        };
                        result = await crudHelper.fnRead(entity, where);
                        break;
                    case "update":
                        entity = "Books";
                        where = {
                            author: "Test Author",
                        };
                        entries = [{
                            author: "Author Test",
                        }];
                        result = await crudHelper.fnUpdate(entity, where, entries);
                        break;
                    case "delete":
                        entity = "Books";
                        where = {
                            author: "Author Test",
                        };
                        result = await crudHelper.fnDelete(entity, where);
                        break;
                }
                const msg = bundle.getText("SUCCESS_MESSAGE", [
                    JSON.stringify(result)
                ]);
                return msg;
            } catch (error) {
                return error;
            }
        })

        this.on('READ', Books, async () => {
            const where = {
                lastName: "Lara"
            };
            const query = SELECT
                .from(Books)
                .where(where);
            const result = await cds.run(query);
            return result;
        })


        // Add base class's handlers. Handlers registered above go first.
        return super.init()

    }
}