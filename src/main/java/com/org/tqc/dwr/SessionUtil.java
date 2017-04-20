package com.org.tqc.dwr;


import org.directwebremoting.*;
import org.directwebremoting.ui.dwr.Util;

public class SessionUtil {

    public static void setSessionsValue(final String tagId, final String value, String... uris) {
        if (uris == null || uris.length == 0) {
            Browser.withAllSessions(new Runnable() {
                public void run() {
                    Util.setValue(tagId, value);
                }
            });
        } else {
            for (String uri : uris) {
                System.out.println("=====  loop =============" + uri);
                String page = ServerContextFactory.get().getContextPath() + uri;    //	"/login";
                Browser.withPage(page, new Runnable() {
                    public void run() {
                        Util.setValue(tagId, value);
                    }
                });
            }
        }
    }

    @SuppressWarnings("rawtypes")
    public static void addSessionsValue(final String tagId, final String[][] str) {
        System.out.println("addSessionsValue()");
        Browser.withAllSessions(new Runnable() {
            public void run() {
                Util.addRows(tagId, str);
            }
        });
    }

    public static void setAllSessionsValue(final String tagId, final String value) {
        Browser.withAllSessions(new Runnable() {
            public void run() {
                Util.setValue(tagId, value);
            }
        });
    }

    public static void setPageValue(String uri, final String tagId, final String value) {
        String page = ServerContextFactory.get().getContextPath() + uri;    //	"/login";
        Browser.withPage(page, new Runnable() {
            public void run() {
                Util.setValue(tagId, value);
            }
        });
    }

    public static void setFilteredPageValue(String uri, String attr, final String tagId, final String value) {
        String page = ServerContextFactory.get().getContextPath() + uri;    //	"/login";
        ScriptSessionFilter attributeFilter = new AttributeScriptSessionFilter(attr);
        Browser.withPageFiltered(page, attributeFilter, new Runnable() {
            public void run() {
                Util.setValue(tagId, value);
            }
        });
    }

    public static void setFilteredSessionsValue(String attr, final String tagId, final String value) {
        ScriptSessionFilter attributeFilter = new AttributeScriptSessionFilter(attr);
        Browser.withAllSessionsFiltered(attributeFilter, new Runnable() {
            public void run() {
                Util.setValue(tagId, value);
            }
        });
    }

    /**
     * Called from the client to add an attribute on the ScriptSession.  This
     * attribute will be used so that only pages (ScriptSessions) that have
     * set this attribute will be updated.
     */
    public static void addAttributeToScriptSession(String strAttritube) {
        ScriptSession scriptSession = WebContextFactory.get().getScriptSession();
        scriptSession.setAttribute(strAttritube, true);
    }

    /**
     * Called from the client to remove an attribute from the ScriptSession.
     * When called from a client that client will no longer receive updates (unless addAttributeToScriptSession)
     * is called again.
     */
    public static void removeAttributeToScriptSession(String strAttritube) {
        ScriptSession scriptSession = WebContextFactory.get().getScriptSession();
        scriptSession.removeAttribute(strAttritube);
    }

//    public static class AttributeScriptSessionFilter implements ScriptSessionFilter
//    {
//        public AttributeScriptSessionFilter(String attributeName)
//        {
//            this.attributeName = attributeName;
//        }
//
//        /* (non-Javadoc)
//         * @see org.directwebremoting.ScriptSessionFilter#match(org.directwebremoting.ScriptSession)
//         */
//        @Override
//        public boolean match(ScriptSession session)
//        {
//            Object check = session.getAttribute(attributeName);
//            return (check != null && check.equals(Boolean.TRUE));
//        }
//
//        private final String attributeName;
//    }
}