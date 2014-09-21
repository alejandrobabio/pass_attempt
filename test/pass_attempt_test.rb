# coding: utf-8
require 'test_helper'

describe PassAttempt do

  it 'should work with 10 parms and a block' do
    cond = ->(a) { true }
    PassAttempt.try('n', cond) { 'hello world' }.must_equal 'hello world'
  end

  it 'should not process block if condition is false' do
    condition = ->(attempt) { false }
    PassAttempt.try('z', condition) { 'hello' }.must_equal nil
  end

  it 'should count by name and evaluate condition' do
    condition = ->(attempt) { attempt.odd? }
    PassAttempt.try('a', condition) { 'hello' }.must_equal 'hello'
    PassAttempt.try('b', condition) { 'hello' }.must_equal 'hello'
    PassAttempt.try('b', condition) { 'hello' }.must_equal nil
    PassAttempt.try('b', condition) { 'hello' }.must_equal 'hello'
    PassAttempt.try('b', condition) { 'hello' }.must_equal nil
    PassAttempt.try('a', condition) { 'hello' }.must_equal nil
    PassAttempt.try('a', condition) { 'hello' }.must_equal 'hello'
  end

  it 'apply log2 func on condition' do
    2.times do
      PassAttempt.try('c', :log2) { 'hello' }.must_equal 'hello'
    end
    PassAttempt.try('c', :log2) { 'hello' }.must_equal nil
    PassAttempt.try('c', :log2) { 'hello' }.must_equal 'hello'
    3.times do
      PassAttempt.try('c', :log2) { 'hello' }.must_equal nil
    end
    PassAttempt.try('c', :log2) { 'hello' }.must_equal 'hello'
  end

  it 'apply log10 func on condition' do
    PassAttempt.try('d', :log10) { 'hello' }.must_equal 'hello'
    8.times do
      PassAttempt.try('d', :log10) { 'hello' }.must_equal nil
    end
    PassAttempt.try('d', :log10) { 'hello' }.must_equal 'hello'
  end
end
