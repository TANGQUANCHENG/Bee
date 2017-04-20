package com.org.tqc.dwr;

import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;

public class AttributeScriptSessionFilter implements ScriptSessionFilter {
    public AttributeScriptSessionFilter(String attributeName) {
        this.attributeName = attributeName;
    }

    /* (non-Javadoc)
     * @see org.directwebremoting.ScriptSessionFilter#match(org.directwebremoting.ScriptSession)
     */
    public boolean match(ScriptSession session) {
        System.out.println("match");
        Object check = session.getAttribute(attributeName);
        return (check != null && check.equals(Boolean.TRUE));
    }

    private final String attributeName;
}
