package java0.conc0303;

import java.util.concurrent.*;

/**
 * 本周作业：（必做）思考有多少种方式，在main函数启动一个新线程或线程池，
 * 异步运行一个方法，拿到这个方法的返回值后，退出主线程？
 * 写出你的方法，越多越好，提交到github。
 *
 * 一个简单的代码参考：
 */
public class Homework03 {
    
    public static void main(String[] args) throws InterruptedException {

        ExecutorService executorService = Executors.newFixedThreadPool(10);

        long start1 = System.currentTimeMillis();
        Future<Integer> result1 = executorService.submit(new Callable<Integer>() {
            @Override
            public Integer call() throws Exception {
                return Homework03.sum();
            }
        });
        long end1 = System.currentTimeMillis();


        long start2 = System.currentTimeMillis();
        FutureTask<Integer> result2 = new FutureTask(new Callable<Integer>() {
            @Override
            public Integer call() throws Exception {
                return Homework03.sum();
            }
        });
        executorService.submit(result2);
        long end2 = System.currentTimeMillis();


        long start3 = System.currentTimeMillis();
        Exchanger exchanger = new Exchanger();
        executorService.execute(() -> {
            try {
                exchanger.exchange(Homework03.sum());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        long end3 = System.currentTimeMillis();     //55ms
        Integer result3 = (Integer) exchanger.exchange(0);
        //long end3 = System.currentTimeMillis();       //170ms


        statistic(1, start1, end1, result1);        //1ms
        statistic(2, start2, end2, result2);        //1ms
        statistic(3, start3, end3, result3);        //55ms?


        executorService.shutdown();
        System.out.println("Main thread End!");
    }


    private static int sum() {
        return fibo(36);
    }
    
    private static int fibo(int a) {
        if ( a < 2) 
            return 1;
        return fibo(a-1) + fibo(a-2);
    }

    private static void statistic(int threadId, long startStamp, long endStamp, Future<Integer> future) {
        try {
            statistic(threadId, startStamp, endStamp, future.get(10, TimeUnit.SECONDS));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private static void statistic(int threadId, long startStamp, long endStamp, Integer result) {
            System.out.println(threadId+"号线程异步计算结果："+result);
            System.out.println(threadId+"号线程耗时："+(endStamp-startStamp)+"ms");
    }

}
