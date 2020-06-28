package submission_review_system.util;

public class Assert {

    public static <E> E notNull(E obj) throws Exception {
        if (obj != null && obj != "") {
            return obj;
        } else {
            throw new Exception("断言: 空指针异常。");
        }
    }

    public static Integer notNull(Integer obj) throws Exception {
        if (obj != 0) {
            return obj;
        } else {
            throw new Exception("断言: 0 行受影响异常。");
        }
    }

    public static <E> E isNull(E obj) throws Exception {
        if (obj == null || obj == "") {
            return obj;
        } else {
            throw new Exception("断言: 指针异常。");
        }
    }

}
