package bean;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/*
 * 通过用户输入类的全路径，来获取该类的成员方法和属性
 * Declared获取全部不管是私有和公有
 * 1.获取访问类的Class对象
 * 2.调用Class对象的方法返回访问类的方法和属性信息
 */
public class Test {

    public static void main(String[] args) {
        try {
            //获取Person类的Class对象
//            Class clazz=Class.forName("bean.Person");
            Class clazz = Person.class;
            //获取Person类的所有方法信息
            Method[] method = clazz.getDeclaredMethods();
            for (Method m : method) {
                System.out.println(m.toString());
            }

            //获取Person类的所有成员属性信息
            Field[] field = clazz.getDeclaredFields();
            for (Field f : field) {
                System.out.println(f.toString());
            }

            //获取Person类的所有构造方法信息
            Constructor[] constructor = clazz.getDeclaredConstructors();
            for (Constructor c : constructor) {
                System.out.println(c.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}