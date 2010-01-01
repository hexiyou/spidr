require 'spidr/cookie_jar'

require 'spec_helper'

describe CookieJar do
  before(:each) do
    @cookie_jar = CookieJar.new
  end

  it "should add a cookie to the jar" do
    @cookie_jar['zerosum.org'] = 'admin=ofcourseiam'

    @cookie_jar.size.should == 1
  end

  it "should override previous cookies in the jar" do
    @cookie_jar['zerosum.org'] = 'admin=ofcourseiam'
    @cookie_jar['zerosum.org'] = 'admin=somethingcompletelydifferent'

    @cookie_jar['zerosum.org'].should == 'admin=somethingcompletelydifferent'
  end

  it "should retrieve cookies for the named host" do
    @cookie_jar['zerosum.org'] = 'admin=ofcourseiam'

    @cookie_jar['zerosum.org'].should == 'admin=ofcourseiam'
  end

  it "should clear all cookies" do
    @cookie_jar['zerosum.org'] = 'cookie=foobar'
    @cookie_jar.clear!

    @cookie_jar.size.should == 0
  end
end
