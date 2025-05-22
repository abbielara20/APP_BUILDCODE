import { TextBundle } from '@sap/textbundle';
import path from 'path';

export default class TextBundleClass {
    /**
     * Retrieves the localized strings from i18n
     * @param {string} locale - local of the user logged in
     * @returns {object} bundle - details from the locale
     */
    fnGetTextBundle(locale: string): any {
        const bundle = new TextBundle("../i18n/i18n", locale);
        return bundle;
    }
}